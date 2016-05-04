package util;

import models.User;
import java.util.*;
import com.fasterxml.jackson.databind.JsonNode;

public class RegisterCriteria implements Criteria {

	public List<User> meetCriteria(JsonNode response) {
		List<User> res = new ArrayList<User>();
		for (JsonNode n: response) {

                    //newly added
        	if(!n.get("status").asBoolean()) {

            	User obj = new User();
                obj.setUserName(n.get("userName").textValue());
                try {
                    obj.setEmail(n.get("email").textValue());
                } catch (Exception e){
                    obj.setEmail("");
                }
                obj.setUserName(n.get("userName").textValue()); obj.setId(Long.parseLong(n.get("id").toString()));
                obj.setAvatar(n.get("avatar").textValue());

                res.add(obj);
            }

         }
         return res;
	}
}