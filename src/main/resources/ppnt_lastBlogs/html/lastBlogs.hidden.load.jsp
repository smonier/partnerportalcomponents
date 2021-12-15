<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="maxBlogs" value="${currentNode.properties['maxBlogs']}"/>
<c:set var="startNode" value="${currentNode.properties['j:startNode'].node}"/>
<c:set var="sortDirection" value="${currentNode.properties['j:sortDirection'].string}"/>
<c:set var="filter" value="${currentNode.properties['filter']}"/>
<c:set var="blogDate" value="${currentNode.properties['date']}"/>


<c:choose>
    <c:when test="${empty filter or empty filter.string}">
        <c:set var="lastBlogsStatement" value="select * from [jcnt:blogEntry] as blogEntry where ISDESCENDANTNODE(blogEntry,'${startNode.path}') order by blogEntry.[date] ${sortDirection}"/>
    </c:when>
    <c:otherwise>
        <c:set var="lastBlogsStatement" value="select * from [jcnt:blogEntry] as blogEntry where ISDESCENDANTNODE(blogEntry,'${startNode.path}') and blogEntry.[j:defaultCategory]='${filter.string}' order by blogEntry.[date] ${sortDirection}"/>
    </c:otherwise>
</c:choose>

<script>
    console.log("${lastBlogsStatement}");
</script>
<jcr:sql var="listQuery" sql="${lastBlogsStatement}" limit="${maxBlogs.long}"  />
<c:forEach items="${listQuery.nodes}" var="blogEntry">
    <script>console.log("${blogEntry.properties['date']}");</script>
    <template:module node="${blogEntry}" view="${currentNode.properties['j:subNodesView'].string}" editable="false"/>
</c:forEach>

