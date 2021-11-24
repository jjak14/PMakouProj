<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Gallerie Controller
*| --------------------------------------------------------------------------
*| Gallerie site
*|
*/
class Gallerie extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_gallerie');
		$this->load->model('group/model_group');
		$this->lang->load('web_lang', $this->current_lang);
	}

	/**
	* show all Galleries
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('gallerie_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['galleries'] = $this->model_gallerie->get($filter, $field, $this->limit_page, $offset);
		$this->data['gallerie_counts'] = $this->model_gallerie->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/gallerie/index/',
			'total_rows'   => $this->data['gallerie_counts'],
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Gallerie List');
		$this->render('backend/standart/administrator/gallerie/gallerie_list', $this->data);
	}
	
	/**
	* Add new galleries
	*
	*/
	public function add()
	{
		$this->is_allowed('gallerie_add');

		$this->template->title('Gallerie New');
		$this->render('backend/standart/administrator/gallerie/gallerie_add', $this->data);
	}

	/**
	* Add New Galleries
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('gallerie_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		

		$this->form_validation->set_rules('gallerie_photos_name', 'Photos', 'trim|required');
		

		$this->form_validation->set_rules('datePublication', 'DatePublication', 'trim|required');
		

		

		if ($this->form_validation->run()) {
			$gallerie_photos_uuid = $this->input->post('gallerie_photos_uuid');
			$gallerie_photos_name = $this->input->post('gallerie_photos_name');
		
			$save_data = [
				'datePublication' => $this->input->post('datePublication'),
			];

			
			if (!is_dir(FCPATH . '/uploads/gallerie/')) {
				mkdir(FCPATH . '/uploads/gallerie/');
			}

			if (!empty($gallerie_photos_name)) {
				$gallerie_photos_name_copy = date('YmdHis') . '-' . $gallerie_photos_name;

				rename(FCPATH . 'uploads/tmp/' . $gallerie_photos_uuid . '/' . $gallerie_photos_name, 
						FCPATH . 'uploads/gallerie/' . $gallerie_photos_name_copy);

				if (!is_file(FCPATH . '/uploads/gallerie/' . $gallerie_photos_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['photos'] = $gallerie_photos_name_copy;
			}
		
			
			$save_gallerie = $this->model_gallerie->store($save_data);
            

			if ($save_gallerie) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_gallerie;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/gallerie/edit/' . $save_gallerie, 'Edit Gallerie'),
						anchor('administrator/gallerie', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/gallerie/edit/' . $save_gallerie, 'Edit Gallerie')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/gallerie');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/gallerie');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = 'Opss validation failed';
			$this->data['errors'] = $this->form_validation->error_array();
		}

		$this->response($this->data);
	}
	
		/**
	* Update view Galleries
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('gallerie_update');

		$this->data['gallerie'] = $this->model_gallerie->find($id);

		$this->template->title('Gallerie Update');
		$this->render('backend/standart/administrator/gallerie/gallerie_update', $this->data);
	}

	/**
	* Update Galleries
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('gallerie_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
				$this->form_validation->set_rules('gallerie_photos_name', 'Photos', 'trim|required');
		

		$this->form_validation->set_rules('datePublication', 'DatePublication', 'trim|required');
		

		
		if ($this->form_validation->run()) {
			$gallerie_photos_uuid = $this->input->post('gallerie_photos_uuid');
			$gallerie_photos_name = $this->input->post('gallerie_photos_name');
		
			$save_data = [
				'datePublication' => $this->input->post('datePublication'),
			];


			
			if (!is_dir(FCPATH . '/uploads/gallerie/')) {
				mkdir(FCPATH . '/uploads/gallerie/');
			}

			if (!empty($gallerie_photos_uuid)) {
				$gallerie_photos_name_copy = date('YmdHis') . '-' . $gallerie_photos_name;

				rename(FCPATH . 'uploads/tmp/' . $gallerie_photos_uuid . '/' . $gallerie_photos_name, 
						FCPATH . 'uploads/gallerie/' . $gallerie_photos_name_copy);

				if (!is_file(FCPATH . '/uploads/gallerie/' . $gallerie_photos_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['photos'] = $gallerie_photos_name_copy;
			}
		
			
			$save_gallerie = $this->model_gallerie->change($id, $save_data);

			if ($save_gallerie) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/gallerie', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/gallerie');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/gallerie');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = 'Opss validation failed';
			$this->data['errors'] = $this->form_validation->error_array();
		}

		$this->response($this->data);
	}
	
	/**
	* delete Galleries
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('gallerie_delete');

		$this->load->helper('file');

		$arr_id = $this->input->get('id');
		$remove = false;

		if (!empty($id)) {
			$remove = $this->_remove($id);
		} elseif (count($arr_id) >0) {
			foreach ($arr_id as $id) {
				$remove = $this->_remove($id);
			}
		}

		if ($remove) {
            set_message(cclang('has_been_deleted', 'gallerie'), 'success');
        } else {
            set_message(cclang('error_delete', 'gallerie'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Galleries
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('gallerie_view');

		$this->data['gallerie'] = $this->model_gallerie->join_avaiable()->filter_avaiable()->find($id);

		$this->template->title('Gallerie Detail');
		$this->render('backend/standart/administrator/gallerie/gallerie_view', $this->data);
	}
	
	/**
	* delete Galleries
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$gallerie = $this->model_gallerie->find($id);

		if (!empty($gallerie->photos)) {
			$path = FCPATH . '/uploads/gallerie/' . $gallerie->photos;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_gallerie->remove($id);
	}
	
	/**
	* Upload Image Gallerie	* 
	* @return JSON
	*/
	public function upload_photos_file()
	{
		if (!$this->is_allowed('gallerie_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'gallerie',
		]);
	}

	/**
	* Delete Image Gallerie	* 
	* @return JSON
	*/
	public function delete_photos_file($uuid)
	{
		if (!$this->is_allowed('gallerie_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'photos', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'gallerie',
            'primary_key'       => 'idGallerie',
            'upload_path'       => 'uploads/gallerie/'
        ]);
	}

	/**
	* Get Image Gallerie	* 
	* @return JSON
	*/
	public function get_photos_file($id)
	{
		if (!$this->is_allowed('gallerie_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$gallerie = $this->model_gallerie->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'photos', 
            'table_name'        => 'gallerie',
            'primary_key'       => 'idGallerie',
            'upload_path'       => 'uploads/gallerie/',
            'delete_endpoint'   => 'administrator/gallerie/delete_photos_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('gallerie_export');

		$this->model_gallerie->export(
			'gallerie', 
			'gallerie',
			$this->model_gallerie->field_search
		);
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('gallerie_export');

		$this->model_gallerie->pdf('gallerie', 'gallerie');
	}


	public function single_pdf($id = null)
	{
		$this->is_allowed('gallerie_export');

		$table = $title = 'gallerie';
		$this->load->library('HtmlPdf');
      
        $config = array(
            'orientation' => 'p',
            'format' => 'a4',
            'marges' => array(5, 5, 5, 5)
        );

        $this->pdf = new HtmlPdf($config);
        $this->pdf->setDefaultFont('stsongstdlight'); 

        $result = $this->db->get($table);
       
        $data = $this->model_gallerie->find($id);
        $fields = $result->list_fields();

        $content = $this->pdf->loadHtmlPdf('core_template/pdf/pdf_single', [
            'data' => $data,
            'fields' => $fields,
            'title' => $title
        ], TRUE);

        $this->pdf->initialize($config);
        $this->pdf->pdf->SetDisplayMode('fullpage');
        $this->pdf->writeHTML($content);
        $this->pdf->Output($table.'.pdf', 'H');
	}

	
}


/* End of file gallerie.php */
/* Location: ./application/controllers/administrator/Gallerie.php */