<%@ page import="dd.project.wolverine.PushAndroid" %>



<div class="fieldcontain ${hasErrors(bean: pushAndroidInstance, field: 'deviceId', 'error')} ">
	<label for="deviceId">
		<g:message code="pushAndroid.deviceId.label" default="Device Id" />
		
	</label>
	<g:textField name="deviceId" value="${pushAndroidInstance?.deviceId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pushAndroidInstance, field: 'pushScores', 'error')} ">
	<label for="pushScores">
		<g:message code="pushAndroid.pushScores.label" default="Push Scores" />
		
	</label>
	<g:checkBox name="pushScores" value="${pushAndroidInstance?.pushScores}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pushAndroidInstance, field: 'pushFinal', 'error')} ">
	<label for="pushFinal">
		<g:message code="pushAndroid.pushFinal.label" default="Push Final" />
		
	</label>
	<g:checkBox name="pushFinal" value="${pushAndroidInstance?.pushFinal}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pushAndroidInstance, field: 'createTime', 'error')} required">
	<label for="createTime">
		<g:message code="pushAndroid.createTime.label" default="Create Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createTime" precision="day"  value="${pushAndroidInstance?.createTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pushAndroidInstance, field: 'updateTime', 'error')} ">
	<label for="updateTime">
		<g:message code="pushAndroid.updateTime.label" default="Update Time" />
		
	</label>
	<g:datePicker name="updateTime" precision="day"  value="${pushAndroidInstance?.updateTime}" default="none" noSelection="['': '']" />
</div>

