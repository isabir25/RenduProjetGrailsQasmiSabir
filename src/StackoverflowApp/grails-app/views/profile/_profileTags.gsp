
<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">									
					<g:each in="${getTags?}" var="tag">			
						<div class="col-lg-3">
							<div class="pricing-box-alt">
								<div class="pricing-heading">
									<h3>${tag?.name}</h3>
								</div>
								<div class="pricing-terms">
									<h6>${tag?.description}</h6>
								</div>
								
							</div>
						</div>					
					</g:each>
			</div>
		</div>
	</div>
</section>
