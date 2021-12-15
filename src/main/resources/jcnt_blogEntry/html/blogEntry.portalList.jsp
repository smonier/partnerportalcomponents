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

<template:addResources type="css" resources="teamMember.css"/>

<c:url var="blogUrl" value="${currentNode.url}" context="/"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
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
    </c:when>
    <c:otherwise>
        <fmt:formatDate value="${blogDate.time}" pattern="MMMM d, yyyy" var="formatedDate"/>
    </c:otherwise>
</c:choose>
<div class="card mt-2" style="width : 100%;flex-direction: row; background-color: transparent;border: none">
        <a href="${blogUrl}"><img src="${image.node.url}" alt="${title}" height="75px" width="75px"
                                  class="rounded-circle ml-5 mb-2 img-thumbnailBlogList d-block"></a>
    <div class="card-body">
        <h6 class="mb-2"><a href="${blogUrl}">${fn:escapeXml(title)}</a></h6>
        <div class="meta-wrap">
            <div class="pr-4"><i class="far fa-calendar-alt"></i>
                ${formatedDate}
                <c:if test="${! empty authorName}">
                    &nbsp;&nbsp;<i class="fas fa-user"></i> ${authorName}
                </c:if>
            </div>
        </div>
    </div>
</div>
