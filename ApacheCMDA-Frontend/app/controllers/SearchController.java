package controllers;

import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.JsonNode;
import models.SearchResult;
import models.Workflow;
import play.api.mvc.*;
import play.mvc.Result;
import util.APICall;
import util.Constants;
import views.html.*;
import play.mvc.Controller;
import java.util.ArrayList;
import java.util.List;
import models.User;

import util.*;

public class SearchController extends Controller{
    public static boolean notpass() {
        if (session("id") == null) {
            return true;
        }
        return false;
    }

    public static Result index() {
        if (notpass()) return redirect(routes.Application.login());
        return ok(search.render(session("username"), session("id"), null, null, null));
    }

    public static Result search(String category, String keywd) {
        if (notpass()) return redirect(routes.Application.login());
        String path = null;
        ArrayList<User> userArr = new ArrayList<User>();

        switch (category) {
            case "user":
                path = "users";
                JsonNode response = APICall.callAPI(Constants.NEW_BACKEND + path + "/search/" + keywd + "/json");
                if (response == null || response.has("error")) {
                    flash("error", response.get("error").textValue());
                    return ok(search.render(session("username"), session("id"), null, null, null));
                }

                Criteria registerCriteria = new RegisterCriteria();
                List<User> res = registerCriteria.meetCriteria(response);

                // return ok(search.render(session("username"), session("id"), category, userArr, null));
                return ok(search.render(session("username"), session("id"), category, res, null));
            case "tag":
                ArrayList<Workflow> wfArr = new ArrayList<Workflow>();
                JsonNode wfresponse = APICall.callAPI(Constants.NEW_BACKEND + "workflow/getByTag/tag/" + keywd);
                for (JsonNode n: wfresponse) {
                    Workflow wf = new Workflow(n);
                    wfArr.add(wf);
                }
                return ok(search.render(session("username"), session("id"), category, null, wfArr));
            case "workflow":
                ArrayList<Workflow> wfArrt = new ArrayList<Workflow>();
                JsonNode wfresponset = APICall.callAPI(Constants.NEW_BACKEND + "workflow/getByTitle/title/" + keywd);
                for (JsonNode n: wfresponset) {
                    Workflow wf = new Workflow(n);
                    wfArrt.add(wf);
                }
                return ok(search.render(session("username"), session("id"), category, null, wfArrt));
        }

        return ok(search.render(session("username"), session("id"), category, null, null));
    }
}
