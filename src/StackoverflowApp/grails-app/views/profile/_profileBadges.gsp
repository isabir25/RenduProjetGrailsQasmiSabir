
	<div class="col-lg-6">	
		<div class="widget">		
			<ul class="tags">						
				<g:each in="${getBadges}" var="badge">								
					<li><a href="">
						<font size="15" color="#8c7853">.</font> &nbsp; ${badge?.badgeType?.name}</a>&nbsp;x&nbsp;${badge?.number}
					</li>
				</g:each>
			</ul>
		</div> 	
	</div>
