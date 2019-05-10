package edu.autocar.cleancity.view;

import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import edu.autocar.cleancity.broker.MjpegBroker;

@Component("camera")
@Scope("request")
public class CameraView extends MjpegView implements Observer{

	@Autowired
	MjpegBroker broker;	// Single camera와의 차이점
	
	BlockingQueue<byte[]> queue = new LinkedBlockingDeque<byte[]>(5);
	
	int deviceId;
	
	@Override
	protected void init(Map<String, Object> model, 
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.init(model, response);
		
		deviceId = (int)model.get("deviceId");
		broker.addObserver(deviceId, this);
	}
	
	@Override
	protected void cleanup() throws Exception {
		// TODO Auto-generated method stub
		super.cleanup();
		queue.clear();
		broker.deleteObserver(deviceId, this);
	}
	
	@Override
	protected byte[] getImage() throws Exception {
		// TODO Auto-generated method stub

		return queue.take();
	}
	
	@Override
	public void update(Observable o, Object image) {
		// TODO Auto-generated method stub
		try {
			queue.put((byte[])image);
		} catch (InterruptedException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
