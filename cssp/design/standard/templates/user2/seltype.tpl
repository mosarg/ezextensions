<form action={"/content/action"|ezurl} method="post">
	<div align="center"><br>
	<div id="reg_student">
		<div>
			<input type="radio" name="(class)" value="alunni"  > Alunni<br>
		</div>
	</div>
	<div id="reg_prof">
		<div>
			<input type="radio" name="(class)" value="professori"  checked> Professori<br>
		</div>
	</div>
	<div id="ata">
		<div>
			<input type="radio" name="(class)" value="ata" > Ata<br>
		</div>
	</div>
	<div id="genitori">
		<div>
			<input type="radio" name="(class)" value="genitori" > Genitori<br>
		</div>
	</div>
	

	</div>
	<input type="hidden" name="DestinationURL" value="user2/register2" />
	<div class="buttonblock register">
	<input class="button" type="submit" value="{'Prosegui'|i18n('design/standard/user')}">
	</div>
</form>

<form enctype="multipart/form-data"  action={"/user2/seltype/"|ezurl} method="post" name="seltype">
<div class="buttonblock register">
        <input class="button" type="submit" name="CancelButton" value="{'Back'|i18n('design/standard/user')}" />
	</div>
	
</form>