package util;

import com.google.gson.JsonObject;

public class EmptyPasswordError implements LoginError {
	@Override
	public JsonObject errorResponse() {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("error", "Password is empty");
		return jsonObject;
	}
}