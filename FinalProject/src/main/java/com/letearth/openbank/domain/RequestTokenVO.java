package com.letearth.openbank.domain;

import lombok.Data;

@Data
public class RequestTokenVO {
	private String code;
	private String scope;
	private String client_info;
	private String state;
	
	private String client_id;
	private String client_secret;
	private String redirect_uri;
	private String grant_type;
	
	public RequestTokenVO () {}
	
	public void setRequestToken(String client_id, String client_secret, String redirect_uri, String grant_type) {
		this.client_id = client_id;
		this.client_secret = client_secret;
		this.redirect_uri = redirect_uri;
		this.grant_type = grant_type;
	}


	@Override
	public String toString() {
		return "RequestTokenVO [code=" + code + ", scope=" + scope + ", client_info=" + client_info + ", state=" + state
				+ ", client_id=" + client_id + ", client_secret=" + client_secret + ", redirect_uri=" + redirect_uri
				+ ", grant_type=" + grant_type + "]";
	}
	
	
	
	
	
	
}
