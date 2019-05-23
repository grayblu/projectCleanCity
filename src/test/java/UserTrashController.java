
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

import edu.autocar.cleancity.domain.GarbageCollection;
import edu.autocar.cleancity.service.UserService;
import edu.autocar.cleancity.service.GarbageCollectionService;


public class UserTrashController {
	
	@Autowired
	GarbageCollectionService service;
	@Autowired
	UserService service1;

	
	@GetMapping("admin/charts")
	public String UserTrashChart(HttpSession session, Model model) throws Exception {
		List<GarbageCollection> userTrashList = service.getList("user1");
//		System.out.println("서비스 이후 userTrashList: "+ userTrashList);
//		System.out.println("-------------");
//		for(UserTrash ut : userTrashList) {
//			System.out.println("userTrashList: "+ut.getUserid()+"/cap: "+ut.getCap());
//		}
//		System.out.println("-------------")
//		session.setAttribute("trash", userTrashList);
		Gson gson = new Gson();
		String list = gson.toJson(userTrashList);
		System.out.println("JSON 문자열로 변환: "+list);
		model.addAttribute("trash", list);
		return "admin/charts";
	}
}
