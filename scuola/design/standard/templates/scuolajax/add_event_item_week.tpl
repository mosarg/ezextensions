<div class="ajax-form rounded shadowmore">
    <h2>Aggiungi Evento</h2>
    <label for="from_time">Dalle ore</label>
    <select id="from_time">
        {for 28 to 80 as $i}
        <option value="{$i}">{div($i,4)|floor}:{mul(mod($i,4),15)}</option>
        {/for}
    </select>

    <label for="to_time">Alle ore</label>
    <select id="to_time">
        {for 28 to 80 as $i}
        <option value="{$i}">{div($i,4)|floor}:{mul(mod($i,4),15)}</option>
        {/for}
    </select>

    <label for="short_title" >Titolo</label>
    <input id="short_title" type="text" size="42"/>
    <label for="text">Descrizione</label>
    <textarea id="text" cols="40" rows="5"></textarea>
    <input id="cancel_button" type="submit" value="Cancella"/>
    <input id="add_button" type="submit" value="Inserisci"/>
</div>
{literal}
<script type="text/javascript">
	$(function() {
		$(".ajax-form").draggable();
	});
</script>
{/literal}