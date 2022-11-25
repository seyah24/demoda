	/*function save_reply(){
		if(empty($_POST['id'])){
			$_POST['user_id'] = $this->settings->userdata('id');
		}
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$v = $this->conn->real_escape_string($v);
				$data .= " `{$k}`='{$v}' ";
			}
		}
		extract($_POST);
		if(empty($id)){
			$data .= ", comment_id = '$comment_id' ";
			$data .= ", user_id = '{$_SESSION['login_id']}' ";
			$sql = ("INSERT INTO `topic_reply` set $data");
		}else{
			$sql = ("UPDATE `topic_reply` set {$data} where id='{$id}'");
		}
			$save = $this->conn->query($sql);
		if($save){
			$pid = !empty($id) ? $id : $this->conn->insert_id;
			$resp['status'] = 'success';
			if(empty($id))
				$resp['msg'] = "Thêm trả lời mới thành công.";
			else
				$resp['msg'] = "Cập nhật trả lời thành công.";
			
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
			return json_encode($resp);
	}
	
	function delete_reply(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `topic_cmt` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Bình luận được xoá thành công.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
		}
	}*/