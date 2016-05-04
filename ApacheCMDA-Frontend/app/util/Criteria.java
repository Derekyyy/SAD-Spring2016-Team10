package util;

import models.User;
import java.util.*;
import com.fasterxml.jackson.databind.JsonNode;

public interface Criteria {
	public List<User> meetCriteria(JsonNode n);
}