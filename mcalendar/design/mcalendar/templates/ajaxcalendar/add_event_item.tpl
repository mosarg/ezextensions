<div class="ajax-form rounded shadowmore">
    CANE GATTO
    <h2>Aggiungi Evento</h2>
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