package edu.autocar.cleancity.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.autocar.cleancity.domain.GarbageCollection;
import edu.autocar.cleancity.domain.HandleMsg;
import edu.autocar.cleancity.domain.PageInfo;
import edu.autocar.cleancity.domain.ResultMsg;
import edu.autocar.cleancity.domain.Search;
import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.service.GarbageCollectionService;
import edu.autocar.cleancity.service.UserService;

@Controller
public class AdminContorller {
	
	@Autowired
	UserService userService;
	
	@Autowired
	GarbageCollectionService garbageCollectionService;
	
	Gson gson = new Gson();
	
	@GetMapping("/admin/main")
	public String getAdmin(Model model) throws Exception {
		int countUser = userService.count();
		
		List<User> list = userService.getUsers();
		int countBin=0;
		for (User user : list) {
			if(user.getBin() == 1) {
				countBin++;
			}
		}

		model.addAttribute("UserSummary", countUser);
		model.addAttribute("CountBin",countBin);
		return "admin/main";
	}

	
	@GetMapping("/admin/list")
	public String getList(@RequestParam(value="page", defaultValue="1") int page, Model model) throws Exception {
		PageInfo<User> pi = userService.getPage(page);
		model.addAttribute("pi", pi);		
		
		return "admin/list";
	}
	
	@GetMapping("/admin/edit/{userid}")
	public String getEdit(@PathVariable String userid, Model model) throws Exception {
		User user = userService.getUser(userid);
		System.out.println("수정할 회원> " + user);
		model.addAttribute("user", user);
		
		return "admin/edit";
	}
	
	@PostMapping("/admin/edit/{userid}")
	public String postEdit(@PathVariable String userid, User user, Model model) throws Exception {		
		System.out.println("수정할 회원 " + user);
		
		if(userService.update(user) > 0)		
			return "redirect:/admin/list";
		else {
			model.addAttribute("user", user);
			return "admin/edit";
		}
	}
	
	@GetMapping("/admin/monitor")
	public void getMonitor(Model model) throws Exception {
		List<User> list = userService.getUsers();
		System.out.println(list.size());
		Gson gson = new Gson();
		String gsonList = gson.toJson(list);
		model.addAttribute("userList", gsonList);
	}
	
	@PostMapping("/admin/capUpdate")
	@ResponseBody
	public ResponseEntity<ResultMsg> checkId(@RequestBody HandleMsg handleMsg) throws Exception {
		String type = handleMsg.getType();
		System.out.println("핸들 메시지 > " + handleMsg);
		User searchedUser = userService.getUser(handleMsg.getUserid());
		
		if(type.equals("binData")) {
			System.out.println("사용자로부터 입력 받은 아이디 " + handleMsg.getUserid() + " 용량 :" + handleMsg.getCap());
			System.out.println("검색된 회원 " + searchedUser);

			if (searchedUser != null) {
				searchedUser.setCap(handleMsg.getCap());
				userService.update(searchedUser);
				return ResultMsg.response("ok", "갱신되었습니다.");
			} else {
				return ResultMsg.response("fail", "잘못된 접근입니다.");
			}
		} else { // 쓰레기 수거 완료
			if (searchedUser != null) {				
				// 쓰레기 수집 테이블에 데이터 추가
				GarbageCollection garbageCollection = new GarbageCollection();
				garbageCollection.setUserid(searchedUser.getUserid());
				garbageCollection.setAddress(searchedUser.getAddress());
				garbageCollection.setCap(searchedUser.getCap());
				garbageCollectionService.create(garbageCollection);
				
				// 쓰레기 용량 비우고 사용자 계정 업데이트
				searchedUser.setCap(0);
				searchedUser.setCondition("waiting");
				userService.update(searchedUser);
				System.out.println("수거 전 " + searchedUser);
				System.out.println("수거 완료함!");
				return ResultMsg.response("ok", "갱신되었습니다.");
			} else {
				return ResultMsg.response("fail", "잘못된 접근입니다.");
			}
		}
	}

	@GetMapping("/admin/collectingList")
	@ResponseBody
	public ResponseEntity<ResultMsg> getCollectingList(Model model) throws Exception {
		List<User> collectingList = userService.getCollectingList();
		System.out.println("getCollectingList"+collectingList);
		Gson gson = new Gson();

		if (collectingList.size() > 0) {
			model.addAttribute("collectingList", gson.toJson(collectingList));
			return ResultMsg.response("ok", gson.toJson(collectingList));
		} else {
			return ResultMsg.response("fail", gson.toJson(collectingList));
		}
	}
//	브라우저에서 수거버튼을 누를 경우 수거 상태를 변경하는 메서드
	@PostMapping("/admin/updateCollectingList")
	@ResponseBody
	public ResponseEntity<ResultMsg> postUpdateCollectingList(@RequestBody User user) throws Exception {
		String updateCondition = user.getCondition();
		User updatedUser = userService.getUser(user.getUserid());
		updatedUser.setCondition(updateCondition);
		
		System.out.println("쓰레기를 수거할 회원: " + updatedUser.getUserid());
		if (userService.update(updatedUser) > 0) {
			return ResultMsg.response("ok", "리스트 추가 성공");
		} else
			return ResultMsg.response("fail", "리스트 추가 실패");
	}

	@PostMapping("/admin/collectedGarbage")
	@ResponseBody
	public ResponseEntity<ResultMsg> postCollectedGarbage(@RequestBody GarbageCollection garbageCollection) throws Exception {
		System.out.println("추가될 데이터 >> " + garbageCollection);
		garbageCollectionService.create(garbageCollection);
		System.out.println(garbageCollectionService.create(garbageCollection));
		
		return ResultMsg.response("ok","");
	}
	
	@GetMapping("/admin/collection-list")
	public String getCollectionList(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			Search search) throws Exception {
		PageInfo<GarbageCollection> pi = garbageCollectionService.getPage(page);
		model.addAttribute("pi", pi);

		System.out.println("수집 리스트 사이즈 " + pi);
		return "admin/collection-list";
	}

	@PostMapping("/admin/collection-list")
	public String postCollectionList(@RequestParam(value = "page", defaultValue = "1") int page, @Valid Search search,
			BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			model.addAttribute("fail", "검색 유형을 설정하세요.");
			result.reject("검색 유형을 설정하세요.");
		}
		String type = search.getType();
		String content = search.getContent();		
		
		PageInfo<GarbageCollection> pi;
		System.out.println("검색 내용 >> " + search.getContent() + ", 타입 >> " + type);
		
		if (type.equals("userid")) {
			pi = garbageCollectionService.getUserCollection(page, content);
			System.out.println("pi >> " + pi);
		} else if(type.equals("region")) {
			pi = garbageCollectionService.getRegionCollection(page, content);
			System.out.println("pi >> " + pi);
		} else {
			pi = garbageCollectionService.getPage(page);
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("type", type);
		
		return "admin/collection-list";
	}
	

	
	
}
