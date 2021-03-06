<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
	<app:pageHeading entityName="${product.productName}" entityHeadingKey="${isPackage ? 'productPackageDetail.heading' : 'productDetail.heading'}" />
</head>
<body>
	<c:choose>
		<c:when test="${!isOriented}">
			<div id="btn-space" style="display: none;">
				<%--待删除或已产品的产品不能再修改产品（今日修改URI参数可以查看已删除或待删除的产品）--%>
				<c:if test="${product.productId==null  || product.status==0 || product.status==1|| product.status==2}">
				<cartmatic:cartmaticBtn btnType="save" inputType="button" onclick="ps('tabIframeId_${param.tid}','saveProduct2();');" />
				</c:if>
				<c:if test="${product.productId!=null&&product.status!=3}">
					<cartmatic:cartmaticBtn btnType="delete" inputType="button" onclick="ps('tabIframeId_${param.tid}','fnDeleteProduct();');" />
				</c:if>
			</div>
			<div class="top-showMsg-close" id="showMsg_id" style="display: none;" ></div>
		</c:when>
		<c:otherwise>
			<div class="product-position" id="productOriented">
				<span class="selected" name="productInfo"><fmt:message key="product.tab.basis" /> </span>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<span name="productSkuInfo"><fmt:message key="product.tab.sku" /> </span>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<c:if test="${!isPackage}">
					<span name="featureInfo"><fmt:message key="product.tab.features" /> </span>
				</c:if>
				<c:if test="${isPackage}">
					<span name="packageItemInfo"><fmt:message key="product.tab.packageItems" /> </span>
				</c:if>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<span name="descriptionInfo"><fmt:message key="product.tab.description" /> </span>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<span name="productMediaInfo"><fmt:message key="product.tab.media" /> </span>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<span name="seoInfo"><fmt:message key="product.tab.seo" /> </span>
				<img src="${ctxPath}/images/icon/icon_position.gif" width="10" height="8">
				<span name="supplierInfo"><fmt:message key="product.tab.supplier" /> </span>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="blank10"></div>
	<app:showBindErrors bindPath="product.*" />
	<form class="mainForm" method="post" action="${ctxPath}/catalog/product.html" id="productForm">
		<div id="productTab">
			<c:if test="${!isOriented}">
			<ul class="sub-tab">
		    	<li>
					<a href="#productInfo"><fmt:message key="product.tab.basis" /> </a><span id="productInfoTabFlag"></span>
				</li>
				<li>
					<a href="#productSkuInfo"><fmt:message key="product.tab.sku" /> </a><span id="productSkuInfoTabFlag"></span>
				</li>
				<c:if test="${!isPackage}">
					<li>
						<a href="#featureInfo"><fmt:message key="product.tab.features" /> </a><span id="featureInfoTabFlag"></span>
					</li>
				</c:if>
				<c:if test="${isPackage}">
					<li>
						<a href="#packageItemInfo"><fmt:message key="product.tab.packageItems" /> </a><span id="packageItemInfoTabFlag"></span>
					</li>
				</c:if>
				<li>
					<a href="#descriptionInfo"><fmt:message key="product.tab.description" /> </a><span id="descriptionInfoFlag"></span>
				</li>
				
				<li>
					<a href="#productMediaInfo"><fmt:message key="product.tab.media" /> </a><span id="productMediaInfoFlag"></span>
				</li>
				<li>
					<a href="#seoInfo"><fmt:message key="product.tab.seo" /> </a><span id="seoInfoTabFlag"></span>
				</li>
				<li>
					<a href="#promotionInfo"><fmt:message key="product.tab.promotion" /> </a><span id="promotionInfoTabFlag"></span>
				</li>
				<li>
					<a href="#recommendedInfo" onClick="fnInitRecommmended()"><fmt:message key="product.tab.recommended" /> </a><span id="seoInfoTabFlag2"></span>
				</li>
				<li>
					<a href="#supplierInfo"><fmt:message key="product.tab.supplier" /> </a><span id="supplierInfoTabFlag"></span>
				</li>
				<li>
					<a href="#productDeatilContentShow">产品详情页信息</a><span id="talenShow"></span>
				</li>
				
				<li>
					<a href="#talenShow">达人秀</a><span id="talenShow"></span>
				</li>
				
				<c:if test="${not empty product.productId}">
				<li>
					<a href="#otherInfo"><fmt:message key="product.tab.other" /> </a><span id="otderInfoTabFlag"></span>
				</li>
				</c:if>
		    </ul>
			</c:if>
			<div class="blank10"></div>
			<!-- ========== 一个属性编辑开始 ========= -->
			<%@ include file="./include/productInfo.jsp"%>
			<%@ include file="./include/productSkuInfo.jsp"%>
			<c:if test="${!isPackage}">
				<%@ include file="./include/feature.jsp"%>
			</c:if>
			<c:if test="${isPackage}">
				<%@ include file="./include/packageItemInfo.jsp"%>
			</c:if>
			<%@ include file="./include/descriptionInfo.jsp"%>
			<%@ include file="./include/productMediaInfo.jsp"%>
			<%@ include file="./include/seoInfo.jsp"%> 
			<%@ include file="./include/promotionInfo.jsp"%>
			<%@ include file="./include/recommendedInfo.jsp"%>
			<%@ include file="./include/supplierInfo.jsp"%>
			<%@ include file="./include/talenshow.jsp"%>
			<%@ include file="./include/productDeatilContentShow.jsp"%>
			
			<c:if test="${not empty product.productId}">
				<%@ include file="./include/otherInfo.jsp"%>
			</c:if>
		</div>
	</form>
	<v:javascript formName="product" staticJavascript="false" />
	<v:javascript formName="productDescription" staticJavascript="false" />
	<app:ui_quickTip/>
	<script type="text/javascript" src="<c:url value="/scripts/cartmatic/catelog/productForm.js"/>"></script>

</body>