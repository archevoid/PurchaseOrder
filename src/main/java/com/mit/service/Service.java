package com.mit.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public abstract class Service {
	
	protected <Beans> boolean hasNullField(Beans bean) {
		try {
			Class<?> cls = Class.forName(bean.getClass().getName());
			
			Method[] methods = cls.getMethods();
			
			for(Method m : methods) {
				if(m.getName().contains("get")) {
					if(m.invoke(bean) == null) {
						return true;
					}
				}
			}
			
			return false;
		} catch (ClassNotFoundException|InvocationTargetException|IllegalAccessException e) {
			return true;
		}
	}
}
