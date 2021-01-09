package com.tangjia.web;

import com.tangjia.Utils.MessageUtil;
import com.tangjia.pojo.User;

import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


//配置Configurator，使得EndpointConfig的config携带HttpSession
@ServerEndpoint(value = "/websocket" , configurator = HttpSessionConfigurator.class)
public class WebSocket extends HttpServlet{

	private static final long serialVersionUID = 1L;

		//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
		private static int onlineCount = 0;

		//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
		private static CopyOnWriteArraySet<WebSocket> webSocketSet = new CopyOnWriteArraySet<WebSocket>();

		//与某个客户端的连接会话，需要通过它来给客户端发送数据
		private Session session;
		
		//登录的用户
		private String user;

		private String to;
		//客户端的session
		private HttpSession httpSession;

		@OnOpen
		public void onOpen(Session session, EndpointConfig config) throws IOException {
			this.session = session;
			//将httpsession注入到该线程的属性中
			this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
			User user1 = (User) httpSession.getAttribute("user");
			//获取当前httpsession中的user
			this.user = user1.getUsername();

			System.out.println("当前登录的用户为"+ this.user);
			if (isLogin(this.user)) {
				System.out.println("当前用户已经加入！当前在线人数为" + getOnlineCount());
			}else{
				webSocketSet.add(this);     //加入set中
				addOnlineCount();           //在线数加1

				System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
			}
//在发消息的时候进行提醒例如有一个消息发送过来了那么就进行推送
			for (WebSocket webSocket:webSocketSet){
				webSocket.sendMessage("$[加入会话]:"+user+"加入会话");
				webSocket.sendMessage("$[增加好友]:"+user);
			}
		}

		@OnClose
		public void onClose(){
			webSocketSet.remove(this);  //从set中删除
			subOnlineCount();           //在线数减1
			System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
		}


		@OnMessage
		public void onMessage(String message, Session session) {
			HashMap<String,String> map = MessageUtil.getMessage(message);
			String fromname = map.get("forName");
			String toname = map.get("toName");

			String content = map.get("content");
			System.out.println("来自客户端|" + user + "|的消息:" + message);
			if (this.user.equals(fromname)) {
				try {
					this.sendMessage("客户端异常");
					onClose();
				} catch (IOException e) {

					e.printStackTrace();
				}
			}
			if (isLogin(toname)) {
				//发送给指定好友的消息
				for(WebSocket item: webSocketSet){
					try {
						if (item.user.equals(toname)) {
							/*this.sendMessage("发送给"+toname+"的消息:"+content);*/
							item.sendMessage("来自|"+user+"|的消息:"+content);
						}
					} catch (IOException e) {
						e.printStackTrace();
						continue;
					}
				}
			}else{
				try {
					this.sendMessage("$[登录异常]:该好友未登录！");
					System.out.println("该好友没登录");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}


		@OnError
		public void onError(Session session, Throwable error){
			System.out.println("发生错误");
			error.printStackTrace();
		}

		public boolean isLogin(String user) {
			//判定是否已经登录
			for(WebSocket item: webSocketSet){
				if (item.user.equals(user)) {
					item = this;
					return true;
				}
			}	
			return false;
		}
		

		public void sendMessage(String message) throws IOException{
			this.session.getBasicRemote().sendText(message);
		}

		public static synchronized int getOnlineCount() {
			return onlineCount;
		}

		public static synchronized void addOnlineCount() {
			WebSocket.onlineCount++;
		}

		public static synchronized void subOnlineCount() {
			WebSocket.onlineCount--;
		}

		public HttpSession getHttpSession() {
			return httpSession;
		}

		public void setHttpSession(HttpSession httpSession) {
			this.httpSession = httpSession;
		}

		public static CopyOnWriteArraySet<WebSocket> getWebSocketSet() {
		return webSocketSet;
	}

		public String getUser() {
		return user;
	}

		public void setUser(String user) {
		this.user = user;
	}
}

