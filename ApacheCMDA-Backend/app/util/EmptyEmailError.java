package util;

import com.google.gson.JsonObject;

public class EmptyEmailError implements LoginError {
	@Override
	public JsonObject errorResponse() {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("error", "Email is empty");
		return jsonObject;
	}
}