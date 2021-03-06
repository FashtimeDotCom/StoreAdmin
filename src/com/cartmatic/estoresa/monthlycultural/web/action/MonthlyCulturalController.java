package com.cartmatic.estoresa.monthlycultural.web.action;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.core.view.AjaxView;
import com.cartmatic.estore.common.model.monthlycultural.MonthlyCultural;
import com.cartmatic.estore.monthlycultural.service.MonthlyCulturalManager;

public class MonthlyCulturalController extends GenericController<MonthlyCultural> {
	
    private MonthlyCulturalManager monthlyCulturalManager = null;

    public void setMonthlyCulturalManager(MonthlyCulturalManager inMgr) {
        this.monthlyCulturalManager = inMgr;
    }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(MonthlyCultural entity) {
		return entity.getMonthlyCulturalName();
	}

	/**
	 * 构造批量更新所需的model。
	 * <P>
	 * 本来这方法对大部分情况也是可以自动分析和转换的，但考虑到比较复杂和难以灵活（验证、缺省值、I18N等、Status转换等），暂时要求各模块自己实现。要求数据要先转换为正确的类型。
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected Map<Integer, Map<String, Object>> getMultiSaveModel(HttpServletRequest request) {
		//FIXME
		throw new RuntimeException("Not implemented yet!");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.BaseController#initController()
	 */
	@Override
	protected void initController() throws Exception {
		mgr = monthlyCulturalManager;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController onSave(javax.servlet.http.HttpServletRequest,
	 *      java.lang.Object, org.springframework.validation.BindException)
	 */
	@Override
	protected void onSave(HttpServletRequest request, MonthlyCultural entity, BindException errors) {
	}
	

	/**
	 * 缺省Action,列出缺省搜索条件的搜索结果列表。必须转给search处理。
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 */
	public ModelAndView defaultAction(HttpServletRequest request,
			HttpServletResponse response) {
	   System.out.println("goodbye");
	 //	CulturalInformation culturalInformation =culturalInformationManager.getById(3);
	//	List<CulturalInformation> CulturalInformationList = culturalInformationManager.getAllByIdArray(culturalInformation.getRecommendArrayId());
	  //  System.out.println(monthlyCultural.size());
		return search(request, response);
	}
	
	
}
