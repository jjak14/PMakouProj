<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Gestionevenement Controller
*| --------------------------------------------------------------------------
*| Gestionevenement site
*|
*/
class Gestionevenement extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_gestionevenement');
		$this->load->model('group/model_group');
		$this->lang->load('web_lang', $this->current_lang);
	}

	/**
	* show all Gestionevenements
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('gestionevenement_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['gestionevenements'] = $this->model_gestionevenement->get($filter, $field, $this->limit_page, $offset);
		$this->data['gestionevenement_counts'] = $this->model_gestionevenement->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/gestionevenement/index/',
			'total_rows'   => $this->data['gestionevenement_counts'],
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Gestionevenement List');
		$this->render('backend/standart/administrator/gestionevenement/gestionevenement_list', $this->data);
	}
	
	/**
	* Add new gestionevenements
	*
	*/
	public function add()
	{
		$this->is_allowed('gestionevenement_add');

		$this->template->title('Gestionevenement New');
		$this->render('backend/standart/administrator/gestionevenement/gestionevenement_add', $this->data);
	}

	/**
	* Add New Gestionevenements
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('gestionevenement_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		

		$this->form_validation->set_rules('Titre', 'Titre', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('Description', 'Description', 'trim|required');
		

		$this->form_validation->set_rules('gestionevenement_photo_name', 'Photo', 'trim|required');
		

		

		if ($this->form_validation->run()) {
			$gestionevenement_photo_uuid = $this->input->post('gestionevenement_photo_uuid');
			$gestionevenement_photo_name = $this->input->post('gestionevenement_photo_name');
		
			$save_data = [
				'Titre' => $this->input->post('Titre'),
				'Description' => $this->input->post('Description'),
			];

			
			if (!is_dir(FCPATH . '/uploads/gestionevenement/')) {
				mkdir(FCPATH . '/uploads/gestionevenement/');
			}

			if (!empty($gestionevenement_photo_name)) {
				$gestionevenement_photo_name_copy = date('YmdHis') . '-' . $gestionevenement_photo_name;

				rename(FCPATH . 'uploads/tmp/' . $gestionevenement_photo_uuid . '/' . $gestionevenement_photo_name, 
						FCPATH . 'uploads/gestionevenement/' . $gestionevenement_photo_name_copy);

				if (!is_file(FCPATH . '/uploads/gestionevenement/' . $gestionevenement_photo_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['photo'] = $gestionevenement_photo_name_copy;
			}
		
			
			$save_gestionevenement = $this->model_gestionevenement->store($save_data);
            

			if ($save_gestionevenement) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_gestionevenement;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/gestionevenement/edit/' . $save_gestionevenement, 'Edit Gestionevenement'),
						anchor('administrator/gestionevenement', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/gestionevenement/edit/' . $save_gestionevenement, 'Edit Gestionevenement')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/gestionevenement');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/gestionevenement');
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
	* Update view Gestionevenements
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('gestionevenement_update');

		$this->data['gestionevenement'] = $this->model_gestionevenement->find($id);

		$this->template->title('Gestionevenement Update');
		$this->render('backend/standart/administrator/gestionevenement/gestionevenement_update', $this->data);
	}

	/**
	* Update Gestionevenements
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('gestionevenement_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
				$this->form_validation->set_rules('Titre', 'Titre', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('Description', 'Description', 'trim|required');
		

		$this->form_validation->set_rules('gestionevenement_photo_name', 'Photo', 'trim|required');
		

		
		if ($this->form_validation->run()) {
			$gestionevenement_photo_uuid = $this->input->post('gestionevenement_photo_uuid');
			$gestionevenement_photo_name = $this->input->post('gestionevenement_photo_name');
		
			$save_data = [
				'Titre' => $this->input->post('Titre'),
				'Description' => $this->input->post('Description'),
			];


			
			if (!is_dir(FCPATH . '/uploads/gestionevenement/')) {
				mkdir(FCPATH . '/uploads/gestionevenement/');
			}

			if (!empty($gestionevenement_photo_uuid)) {
				$gestionevenement_photo_name_copy = date('YmdHis') . '-' . $gestionevenement_photo_name;

				rename(FCPATH . 'uploads/tmp/' . $gestionevenement_photo_uuid . '/' . $gestionevenement_photo_name, 
						FCPATH . 'uploads/gestionevenement/' . $gestionevenement_photo_name_copy);

				if (!is_file(FCPATH . '/uploads/gestionevenement/' . $gestionevenement_photo_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['photo'] = $gestionevenement_photo_name_copy;
			}
		
			
			$save_gestionevenement = $this->model_gestionevenement->change($id, $save_data);

			if ($save_gestionevenement) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/gestionevenement', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/gestionevenement');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/gestionevenement');
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
	* delete Gestionevenements
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('gestionevenement_delete');

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
            set_message(cclang('has_been_deleted', 'gestionevenement'), 'success');
        } else {
            set_message(cclang('error_delete', 'gestionevenement'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Gestionevenements
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('gestionevenement_view');

		$this->data['gestionevenement'] = $this->model_gestionevenement->join_avaiable()->filter_avaiable()->find($id);

		$this->template->title('Gestionevenement Detail');
		$this->render('backend/standart/administrator/gestionevenement/gestionevenement_view', $this->data);
	}
	
	/**
	* delete Gestionevenements
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$gestionevenement = $this->model_gestionevenement->find($id);

		if (!empty($gestionevenement->photo)) {
			$path = FCPATH . '/uploads/gestionevenement/' . $gestionevenement->photo;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_gestionevenement->remove($id);
	}
	
	/**
	* Upload Image Gestionevenement	* 
	* @return JSON
	*/
	public function upload_photo_file()
	{
		if (!$this->is_allowed('gestionevenement_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'gestionevenement',
		]);
	}

	/**
	* Delete Image Gestionevenement	* 
	* @return JSON
	*/
	public function delete_photo_file($uuid)
	{
		if (!$this->is_allowed('gestionevenement_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'photo', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'gestionevenement',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/gestionevenement/'
        ]);
	}

	/**
	* Get Image Gestionevenement	* 
	* @return JSON
	*/
	public function get_photo_file($id)
	{
		if (!$this->is_allowed('gestionevenement_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$gestionevenement = $this->model_gestionevenement->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'photo', 
            'table_name'        => 'gestionevenement',
            'primary_key'       => 'id',
            'upload_path'       => 'uploads/gestionevenement/',
            'delete_endpoint'   => 'administrator/gestionevenement/delete_photo_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('gestionevenement_export');

		$this->model_gestionevenement->export(
			'gestionevenement', 
			'gestionevenement',
			$this->model_gestionevenement->field_search
		);
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('gestionevenement_export');

		$this->model_gestionevenement->pdf('gestionevenement', 'gestionevenement');
	}


	public function single_pdf($id = null)
	{
		$this->is_allowed('gestionevenement_export');

		$table = $title = 'gestionevenement';
		$this->load->library('HtmlPdf');
      
        $config = array(
            'orientation' => 'p',
            'format' => 'a4',
            'marges' => array(5, 5, 5, 5)
        );

        $this->pdf = new HtmlPdf($config);
        $this->pdf->setDefaultFont('stsongstdlight'); 

        $result = $this->db->get($table);
       
        $data = $this->model_gestionevenement->find($id);
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


/* End of file gestionevenement.php */
/* Location: ./application/controllers/administrator/Gestionevenement.php */