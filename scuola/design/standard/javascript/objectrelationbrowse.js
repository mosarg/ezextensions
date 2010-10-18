/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function ORBHandler(AjaxURL) {
    this.url				= AjaxURL;
    this.attribute_id			= 0;
    this.handleHttpResponse			= ORBHandleHttpResponse;
    this.isWorking				= false;
    this.updateNameDelayed			= ORBUpdateNameDelayed;
    this.updateName				= ORBUpdateName;
    this.setTitle				= ORBSetTitle;
    this.getHTTPObject			= ORBGetHTTPObject;
    this.moveItem				= ORBMoveItem;
    this.selectall				= ORBSelectAll;
    this.up					= ORBUp;
    this.down				= ORBDown;
    this.viceversa				= ORBViceversa;
    this.showInput				= ORBShowInput;
    this.showOutput				= ORBShowOutput;
    this.msgNoneSelected			= "please select an item first";
    this.maxStringLength			= 99;
    this.delayTimer				= null; // onKeyUp delay
    this.delay				= 250; // msecs
    this.http				= this.getHTTPObject(); // get the http handler
}


function ORBHandleHttpResponse() {

    // this is an event callback.
    // the 'this' keyword will not work

    if (ORB.http.readyState == 4) {
        if (ORB.http.responseText.indexOf('invalid') == -1) {
            // Use the XML DOM to unpack the objectid and objectname data
            document.getElementById("count_"+ORB.attribute_id).innerHTML='loading...';
            var xmlDocument = ORB.http.responseXML;
            var countelms = xmlDocument.getElementsByTagName('count');
            if (countelms && countelms.length) var count = countelms.item(0).firstChild.data;
            else var count = 0;

            var objectlist = '<select id="items_input_'+ORB.attribute_id+'" style="width: 100%;" multiple size="6" ';
            objectlist += " onChange=\"ORB.setTitle(items_input_"+ORB.attribute_id+","+ORB.attribute_id+");\">";

            var nodelist = '';
            var namelist = '';


            for (i = 0; i < count; i++)
            {
                if (xmlDocument.getElementsByTagName('objectid'))
                    var objectid = xmlDocument.getElementsByTagName('objectid').item(i).firstChild.data;

                if (xmlDocument.getElementsByTagName('objectname'))
                    var objectname = xmlDocument.getElementsByTagName('objectname').item(i).firstChild.data;

                if (xmlDocument.getElementsByTagName('nodeid'))
                    var nodeid = xmlDocument.getElementsByTagName('nodeid').item(i).firstChild.data;

                if (objectid && objectname && nodeid) {
                    if (objectname.length>ORB.maxStringLength) {
                        objectname=objectname.substring(0,ORB.maxStringLength-3)+"...";
                    }
                    objectlist += "<option value='"+ objectid + "'>" + objectname.substring(0,48) + "</option>";
                    nodelist += "<input type='hidden' name='node_" + objectid + "' value='" + nodeid + "'/>";
                    namelist += "<input type='hidden' name='name_" + objectid + "' value='" + objectname + "'/>";
                }
            }

            document.getElementById("selectbox_input_"+ORB.attribute_id).innerHTML=objectlist + '</select>';
            document.getElementById("nodelist_"+ORB.attribute_id).innerHTML=nodelist;
            document.getElementById("namelist_"+ORB.attribute_id).innerHTML=namelist;
            document.getElementById('count_'+ORB.attribute_id).innerHTML= count;
            if (count>0)
            {
                document.getElementById("items_input_"+ORB.attribute_id).options[0].selected=true;
                from=document.getElementById("items_input_"+ORB.attribute_id);
                ORB.setTitle(from,ORB.attribute_id);
            }

            if (count > 99)
            {
                document.getElementById("count_"+ORB.attribute_id).innerHTML='100+';
            }

            ORB.isWorking = false;

        }
    }
}

function ORBUpdateNameDelayed(id)
{
    clearTimeout(this.delayTimer);
    this.delayTimer = setTimeout("ORB.updateName('"+id+"')", this.delay);
}

function ORBUpdateName(id)
{

    clearTimeout(this.delayTimer);
    this.attribute_id=id;
    document.getElementById("selectedtitle_" + id).innerHTML="";
    var class_attribute_id=document.getElementById("contentclass_attribute_" + id).value;
    document.getElementById("count_" +id ).innerHTML='loading.';
    if (!this.isWorking && this.http && class_attribute_id) {
        var objectnameValue = document.getElementById("objectname_" +id ).value;
        var testName = this.url + "/" + class_attribute_id  + "/" + escape(objectnameValue);
        this.http.open("GET", this.url + "/" + class_attribute_id  + "/" + escape(objectnameValue), true);
        this.http.onreadystatechange = this.handleHttpResponse;
        this.isWorking = true;
        this.http.send(null);
        document.getElementById("count_" + id).innerHTML='loading..';
    }
}



function ORBSetTitle(from,id)
{
    if (!id) id = ORB.attribute_id; // shouldnt hap, sync
    SI=from.selectedIndex;
    object_title=from.options[SI].text;
    keyword=document.getElementById("objectname_"+id).value.split(" ");
    for (var i in keyword)
    {
        object_title=object_title.replace(keyword[i],'<b>' + keyword[i] + '</b>');
    }
    document.getElementById("selectedtitle_" +id).innerHTML=object_title;

}

function ORBGetHTTPObject()
{
    var xmlhttp;
    /*@cc_on
							@if (@_jscript_version >= 5)
								try {
									xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
								} catch (e) {
									try {
										xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
									} catch (E) {
										xmlhttp = false;
									}
								}
							@else
								xmlhttp = false;
						@end @*/
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
        try {
            xmlhttp = new XMLHttpRequest();
            xmlhttp.overrideMimeType("text/xml");
        } catch (e) {
            xmlhttp = false;
        }
    }
    return xmlhttp;
}

function ORBMoveItem(from, to, silent)
{
    var f;
    var SI; /* selected Index */
    if (from.options.length==0 || from.selectedIndex==-1)
    {
        if (!silent) alert(this.msgNoneSelected);
        return false;
    }
    if(from.options.length>0)
    {
        for(i=0;i<from.length;i++)
        {
            if(from.options[i].selected)
            {
                SI=from.selectedIndex;
                f=from.options[SI].index;
                to.options[to.length]=new Option(from.options[SI].text,from.options[SI].value);

                from.options[f]=null;

                i--; /* make the loop go through them all */
            }
        }
    }
   return true;
}

function ORBSelectAll(obj,attrid) {
    if (obj.length < 1) return false;
    obj = (typeof obj == "string") ? document.getElementById(obj) : obj;
    if (obj.tagName.toLowerCase() != "select") return false;
    sellist = "";
    if (obj.length==0) {
        sellist += "<input type='hidden' name='SelectedObjectIDArray_" + attrid + "[]' value=''/>";

    } else {
        for (var i=0; i<obj.length; i++) {
            //obj[i].selected = true;
            sellist += "<input type='hidden' name='SelectedObjectIDArray_" + attrid + "[]' value='" + obj[i].value + "'/>";

        }

    }
    document.getElementById("sellist_"+attrid).innerHTML=sellist;
    if (obj.length==0) return false;
    else return true;
}


function ORBUp(obj) {
    obj = (typeof obj == "string") ? document.getElementById(obj) : obj;
    if (obj.tagName.toLowerCase() != "select" && obj.length < 2)
        return false;
    var sel = new Array();
    for (i=0; i<obj.length; i++) {
        if (obj[i].selected == true) {
            sel[sel.length] = i;
        }
    }
    for (i in sel) {
        if (sel[i] != 0 && !obj[sel[i]-1].selected) {
            var tmp = new Array(obj[sel[i]-1].text, obj[sel[i]-1].value, obj[sel[i]-1].style.color, obj[sel[i]-1].style.backgroundColor, obj[sel[i]-1].className, obj[sel[i]-1].id);
            obj[sel[i]-1].text 			= obj[sel[i]].text;
            obj[sel[i]-1].value 		= obj[sel[i]].value;
            obj[sel[i]-1].style.color 	= obj[sel[i]].style.color;
            obj[sel[i]-1].style.backgroundColor = obj[sel[i]].style.backgroundColor;
            obj[sel[i]-1].className 	= obj[sel[i]].className;
            obj[sel[i]-1].id 			= obj[sel[i]].id;
            obj[sel[i]].text 			= tmp[0];
            obj[sel[i]].value 			= tmp[1];
            obj[sel[i]].style.color 	= tmp[2];
            obj[sel[i]].style.backgroundColor = tmp[3];
            obj[sel[i]].className 		= tmp[4];
            obj[sel[i]].id 				= tmp[5];
            obj[sel[i]-1].selected 		= true;
            obj[sel[i]].selected 		= false;
        }
    }
    return true;
}

function ORBDown(obj) {
    obj = (typeof obj == "string") ? document.getElementById(obj) : obj;
    if (obj.tagName.toLowerCase() != "select" && obj.length < 2)
        return false;
    var sel = new Array();
    for (i=obj.length-1; i>-1; i--) {
        if (obj[i].selected == true) {
            sel[sel.length] = i;
        }
    }
    for (i in sel) {
        if (sel[i] != obj.length-1 && !obj[sel[i]+1].selected) {
            var tmp = new Array(obj[sel[i]+1].text, obj[sel[i]+1].value, obj[sel[i]+1].style.color, obj[sel[i]+1].style.backgroundColor, obj[sel[i]+1].className, obj[sel[i]+1].id);
            obj[sel[i]+1].text = obj[sel[i]].text;
            obj[sel[i]+1].value = obj[sel[i]].value;
            obj[sel[i]+1].style.color = obj[sel[i]].style.color;
            obj[sel[i]+1].style.backgroundColor = obj[sel[i]].style.backgroundColor;
            obj[sel[i]+1].className = obj[sel[i]].className;
            obj[sel[i]+1].id = obj[sel[i]].id;
            obj[sel[i]].text = tmp[0];
            obj[sel[i]].value = tmp[1];
            obj[sel[i]].style.color = tmp[2];
            obj[sel[i]].style.backgroundColor = tmp[3];
            obj[sel[i]].className = tmp[4];
            obj[sel[i]].id = tmp[5];
            obj[sel[i]+1].selected = true;
            obj[sel[i]].selected = false;
        }
    }
return true;
}

function ORBViceversa(obj) {
    obj = (typeof obj == "string") ? document.getElementById(obj) : obj;
    if (obj.tagName.toLowerCase() != "select" && obj.length < 2)
        return false;
    var elements = new Array();
    for (i=obj.length-1; i>-1; i--) {
        elements[elements.length] = new Array(obj[i].text, obj[i].value, obj[i].style.color, obj[i].style.backgroundColor, obj[i].className, obj[i].id, obj[i].selected);
    }
    for (i=0; i<obj.length; i++) {
        obj[i].text = elements[i][0];
        obj[i].value = elements[i][1];
        obj[i].style.color = elements[i][2];
        obj[i].style.backgroundColor = elements[i][3];
        obj[i].className = elements[i][4];
        obj[i].id = elements[i][5];
        obj[i].selected = elements[i][6];
    }
return true;
}
function ORBShowInput(id) {
    document.getElementById("panel_output_"+id).style.display="none";
    document.getElementById("panel_input_"+id).style.display="block";
}
function ORBShowOutput(id) {
    document.getElementById("panel_input_"+id).style.display="none";
    document.getElementById("panel_output_"+id).style.display="block";
}




