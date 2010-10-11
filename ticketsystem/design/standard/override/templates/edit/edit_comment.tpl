<form enctype="multipart/form-data" method="post" action={concat("/content/edit/", $object.id, "/", $edit_version)|ezurl}>
<div id="maincontent">
	<div id="fix">
		<div id="maincontent-design">
			<div class="content-edit">
				<div class="context-block">					
					<div class="box-header">
						<div class="box-tc">
							<div class="box-ml">
								<div class="box-mr">
									<div class="box-tl">
										<div class="box-tr">
											<h1 class="context-title">
												Edit comment information
											</h1>
											<div class="header-mainline"></div>
										</div> {* END class="box-tr" *}
									</div> {* END class="box-tl" *}
								</div> {* END class="box-ml" *}
							</div> {* END class="box-ml" *}
						</div> {* END class="box-ml" *}
					</div> {* END class="box-ml" *}
					<div class="box-ml">
						<div class="box-mr">
							<div class="box-content">																
								<div class="context-attributes">
									{include uri="design:content/edit_validation.tpl"}								
									{include uri="design:content/edit_attribute.tpl"}											 											
								</div> {* END class="context-attributes" *}
							</div> {* END class="box-content" *}
						</div> {* END class="box-mr" *}							
					</div> {* END class="box-ml" *}							
					<div class="controlbar">
						<div class="box-bc">
							<div class="box-ml">
								<div class="box-mr">
									<div class="box-tc">
										<div class="box-bl">
											<div class="box-br">
												<div class="block">
													 <input class="button" type="submit" name="PublishButton" value="Submit" />
													 <input class="button" type="submit" name="DiscardButton" value="Cancel" />
													 <input class="button" type="hidden" name="MainNodeID" value="{$main_node_id}" />			  
												</div>  {* END class="block" *}	
											</div> {* END class="box-br" *}	
										</div> {* END class="box-bl" *}	
									</div> {* END class="box-tc" *}	
								</div> {* END class="box-mr" *}	
							</div> {* END class="box-ml" *}	
						</div> {* END class="box-bc" *}	
					</div> {* END class="controlbar" *}	
				</div> {* END class="context-block" *}    
			</div> {* class="content-edit" *}
		</div> {* id="maincontent-design" *}
	</div> {* id="fix" *}
</div> {* id="maincontent" *}
</form>