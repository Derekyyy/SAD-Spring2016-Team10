package util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import models.User;

/**
 * Created by zixiwei on 4/17/16.
 */
public class UserValidState implements State {

    @Override
    public String doAction(Context context, User user) {
        System.out.println("User is valid");
        context.setState(this);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", user.getId());
        jsonObject.addProperty("userName", user.getUserName());
        return new Gson().toJson(jsonObject);
    }

    @Override
    public String toString() {
        return "User Valid State";
    }
}
