package controllers;

import models.Reply;
import models.User;

import java.util.Date;

/**
 * Created by leizheng on 4/24/16.
 */
public class ReplyDisplay {
    public static void showReply(User fromUser, User toUser, Reply reply){
        System.out.println("****************" + new Date().toString() + " [" + fromUser.getUserName() + " to " + toUser.getUserName() + "] : " + reply.getContent());
    }
}

