package util;

import com.google.gson.JsonObject;

public class NoSuchEmailError implements LoginError {
	@Override
	public JsonObject errorResponse() {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("error", "No such email");
		return jsonObject;
	}
}