<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>
<html>
<head>
    <meta name="page-decorator" content="none" />
</head>
<body>

<%@ include file="/WEB-INF/pages/common/fragments/groups/header.jspf" %>

<div class="row-0">
<div class="col-md-6">
<div class="panel panel-default">

<div class="panel-heading">
  <h3><bean:message key="systemgroup.details.status"/></h3>
</div>

<div class="panel-body">
<table class="table">
  <tr>
    <th><bean:message key="systemgroup.details.updates"/></th>
    <td>
      <div class="system-status">
      <c:if test="${errata_counts['se'] > 0}">
        <i class="fa fa-exclamation-circle fa-1-5x text-danger"></i>
        <span class="system-status-critical-updates"><bean:message key="systemgroup.details.criticalupdates"/></span>
        <a class="btn btn-danger" href="/network/systems/groups/errata_list.pxt?sgid=${id}">${errata_counts['se']} <i class="fa fa-arrow-right"></i></a>
      </c:if>
      <c:if test="${(errata_counts['se'] == 0) && ((errata_counts['be'] > 0) || (errata_counts['ee'] > 0))}">
        <i class="fa fa-exclamation-triangle fa-1-5x text-warning"></i>
        <span class="system-status-updates"><bean:message key="systemgroup.details.someupdates"/></span>
        <a class="btn btn-warning" href="/network/systems/groups/errata_list.pxt?sgid=${id}"><i class="fa fa-arrow-right"></i></a>
      </c:if>
      <c:if test="${(errata_counts['se'] == 0) && (errata_counts['be'] == 0) && (errata_counts['ee'] == 0)}">
        <i class="fa fa-check-circle fa-1-5x text-success"></i>
        <span class="system-status-up-to-date"><bean:message key="systemgroup.details.noupdates"/></span>
      </c:if>
      </div>
    </td>
  </tr>
  <tr>
    <th><bean:message key="systemgroup.details.admins"/></th>
    <td>
      <c:if test="${admin_count > 0}">
        ${admin_count} <bean:message key="systemgroup.details.admincount"/>
      </c:if>
      <c:if test="${admin_count == 0}">
        <span class="no-details"><bean:message key="systemgroup.details.none"/></span>
      </c:if>
      <br />

      <rhn:require acl="user_role(org_admin) or user_role(system_group_admin)">
      <br />
      <a href="/network/systems/groups/admin_list.pxt?sgid=${id}"><bean:message key="systemgroup.details.manageadmins"/></a>
      </rhn:require>
    </td>
  </tr>
  <tr>
    <th><bean:message key="systemgroup.details.systems"/></th>
    <td>
      <c:if test="${system_count > 0}">
         <a class="btn btn-info" href="/rhn/groups/ListRemoveSystems.do?sgid=${id}">${system_count} <i class="fa fa-arrow-right"></i></a>
      </c:if>
      <c:if test="${system_count == 0}">
        <span class="no-details"><bean:message key="systemgroup.details.none"/></span>
      </c:if>
    </td>
  </tr>
</table>
</div>
</div>
</div>

<div class="col-md-6">
<div class="panel panel-default">
<div class="panel-heading">
  <h3><bean:message key="systemgroup.details.properties"/>
  <rhn:require acl="user_role(org_admin) or user_role(system_group_admin)">
    (<a href="/network/systems/groups/edit_properties.pxt?sgid=${id}"><bean:message key="systemgroup.details.editproperties"/></a>)
  </rhn:require></h3>
</div>

<div class="panel-body">
<table class="table">
  <tr>
    <th><bean:message key="systemgroup.details.name"/></th>
    <td>${name}</td>
  </tr>
  <tr>
    <th valign="top"><bean:message key="systemgroup.details.description"/></th>
    <td>${description}</td>
  </tr>
</table>
</div>
</div>
</div>
</div>

</body>
</html>