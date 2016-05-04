package util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import controllers.routes;
import models.Suggestion;
import models.Workflow;
import play.data.Form;
import play.mvc.Result;

/**
 * Created by zixiwei on 4/17/16.
 */
public class AddSuggestion extends AddWord {

    @Override
    public ObjectNode readInput(Form<?> form, Long wid) {
        Form<Workflow> f = ((Form<Workflow>) form).bindFromRequest();
        this.wid = wid;

        ObjectMapper mapper = new ObjectMapper();
        ObjectNode jnode = mapper.createObjectNode();
        try {
            jnode.put("wfID", wid.toString());
            jnode.put("userID", session("id"));
            jnode.put("sContent", f.field("sContent").value());
        }catch(Exception e) {
            flash("error", "Form value invalid");
        }
        return jnode;
    }

    @Override
    public Result createOutput(ObjectNode jnode) {
        JsonNode addSgstResponse = Suggestion.createSuggestion(jnode);
        if (addSgstResponse == null || addSgstResponse.has("error")) {
            if (addSgstResponse == null) flash("error", "Create suggestion error.");
            else flash("error", addSgstResponse.get("error").textValue());
            return redirect(routes.WorkflowController.main());
        }
        flash("success", "Add Suggestion successfully.");
        return redirect(routes.WorkflowController.workflowDetail(wid));
    }
}

