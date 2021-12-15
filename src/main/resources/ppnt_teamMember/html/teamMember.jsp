<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>


<template:addResources type="css" resources="teamMember.css"/>

<jcr:nodeProperty node="${currentNode}" name="lastName" var="lastName"/>
<jcr:nodeProperty node="${currentNode}" name="firstName" var="firstName"/>
<jcr:nodeProperty node="${currentNode}" name="title" var="title"/>
<jcr:nodeProperty node="${currentNode}" name="email" var="email"/>
<jcr:nodeProperty node="${currentNode}" name="phone" var="phone"/>
<jcr:nodeProperty node="${currentNode}" name="linkedin" var="linkedin"/>
<jcr:nodeProperty node="${currentNode}" name="twitter" var="twitter"/>
<jcr:nodeProperty node="${currentNode}" name="portrait" var="portrait"/>
<jcr:nodeProperty node="${currentNode}" name="cardBgClass" var="cardBgClass"/>
<jcr:nodeProperty node="${currentNode}" name="textColorClass" var="textColorClass"/>



<div class="card rounded shadow-sm border-0">
    <div class="card-body p-0">
        <div class="${cardBgClass} px-5 py-4 text-center card-img-top"><img src="${portrait.node.url}" alt="${lastName}" width="100" class="rounded-circle mb-2 img-thumbnail d-block mx-auto">
            <h5 class="${textColorClass} mb-0">${firstName}&nbsp;${lastName}</h5>
            <p class="small ${textColorClass} mb-0">${title}</p>
        </div>
        <div class="p-4 d-flex justify-content-center">
            <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item m-0"><a href="mailto:${email}?subject=Partner Contact" class="social-link"><i class="fas fa-envelope-square"></i></a></li>
                <li class="list-inline-item m-0"><a href="tel:${phone}" class="social-link"><i class="fas fa-phone-square-alt"></i></a></li>
                <li class="list-inline-item m-0"><a href="${linkedin}" class="social-link"><i class="fab fa-linkedin"></i></a></li>
                <li class="list-inline-item m-0"><a href="${twitter}" class="social-link"><i class="fab fa-twitter-square"></i></a></li>

            </ul>
        </div>
    </div>
</div>