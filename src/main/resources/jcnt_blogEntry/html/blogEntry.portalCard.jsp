<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="blogStyle.css"/>
<template:addResources type="javascript" resources="wem-event.js"/>

<c:url var="blogUrl" value="${currentNode.url}" context="/"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="linkId" value="${currentNode.properties['j:nodename'].string}"/>

<jcr:nodeProperty node="${currentNode}" name="image" var="image"/>
<c:set var="authorNode" value="${currentNode.properties.author.node}"/>
<c:if test="${! empty authorNode}">
    <c:set var="authorName" value="${authorNode.properties.name.string}"/>
</c:if>

<c:set var="language" value="${renderContext.mainResourceLocale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>
<c:set var="blogDate" value="${currentNode.properties['date']}"/>

<c:if test="${empty timeZone}">
    <c:set var="timeZone" value="ETC"/>
</c:if>
<fmt:setTimeZone value="${timeZone}"/>
<c:choose>
    <c:when test="${language eq 'fr'}">
        <fmt:formatDate value="${blogDate.time}" pattern="d MMMM yyyy" var="formatedDate"/>
        <fmt:formatDate value="${blogDate.time}" pattern="d" var="formatedDateDay"/>
        <fmt:formatDate value="${blogDate.time}" pattern="MMM" var="formatedDateMonth"/>
        <fmt:formatDate value="${blogDate.time}" pattern="yyyy" var="formatedDateYear"/>
    </c:when>
    <c:otherwise>
        <fmt:formatDate value="${blogDate.time}" pattern="MMMM d, yyyy" var="formatedDate"/>
        <fmt:formatDate value="${blogDate.time}" pattern="d" var="formatedDateDay"/>
        <fmt:formatDate value="${blogDate.time}" pattern="MMM" var="formatedDateMonth"/>
        <fmt:formatDate value="${blogDate.time}" pattern="yyyy" var="formatedDateYear"/>
    </c:otherwise>
</c:choose>

    <div class="portalCard card">
        <div class="wrapper" style="background: url(${image.node.url}) 20% 1% / cover no-repeat;">
            <div class="date">
                <span class="day">${formatedDateDay}</span>
                <span class="month">${formatedDateMonth}</span>
                <span class="year">${formatedDateYear}</span>
            </div>
            <div class="textBlock">
            <div class="data">
                <div class="content">
                    <span class="author">${authorName}</span>
                    <h4 class="title"><a href="${blogUrl}" id="${fn:replace(linkId, " ", "_")}"
                                         onclick="buildAndFireClickEvent('${fn:replace(linkId, " ", "_")}')">${fn:escapeXml(title)}</a>
                    </h4>
                    <p class="text">${functions:abbreviate(functions:removeHtmlTags(currentNode.properties.text.string),100,150,'...')}</p>
                </div>

            </div>
            </div>
        </div>
    </div>

