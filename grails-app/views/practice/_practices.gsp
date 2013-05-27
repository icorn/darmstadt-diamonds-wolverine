
Training:
<g:if test="${practiceInstanceList?.size() > 0}">
	<g:set var="numberOfPractices" value="${0}"/>

	<g:each in="${practiceInstanceList}" var="practice">
		<g:if test="${practice?.categoryId == category}">
			<g:set var="numberOfPractices" value="${numberOfPractices + 1}"/>
		</g:if>
	</g:each>

	<g:if test="${numberOfPractices > 0}">
		<ul>
			<g:each in="${practiceInstanceList}" var="practice">
				<g:if test="${practice?.categoryId == category}">
					<li>
						${practice?.completeDate}

						<g:if test="${practice?.facility}">
							<!-- TODO -->
							${practice?.facilityName}
						</g:if>
						<g:else>
							${practice?.facilityName}
						</g:else>
					</li>
				</g:if>
			</g:each>
		</ul>
	</g:if>
	<g:else>
		<br/>Derzeit findet kein Training statt.
	</g:else>
</g:if>
<g:else>
	<br/>Derzeit findet kein Training statt.
</g:else>
