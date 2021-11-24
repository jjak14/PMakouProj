<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Famille Controller
*| --------------------------------------------------------------------------
*| Famille site
*|
*/
class Famille extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_famille');
		$this->load->model('group/model_group');
		$this->lang->load('web_lang', $this->current_lang);
	}

	/**
	* show all Familles
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('famille_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['familles'] = $this->model_famille->get($filter, $field, $this->limit_page, $offset);
		$this->data['famille_counts'] = $this->model_famille->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/famille/index/',
			'total_rows'   => $this->data['famille_counts'],
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Famille List');
		$this->render('backend/standart/administrator/famille/famille_list', $this->data);
	}
	
	/**
	* Add new familles
	*
	*/
	public function add()
	{
		$this->is_allowed('famille_add');

		$this->template->title('Famille New');
		$this->render('backend/standart/administrator/famille/famille_add', $this->data);
	}

	/**
	* Add New Familles
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('famille_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		

		$this->form_validation->set_rules('nomFamille', 'NomFamille', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('nombreEnfant', 'NombreEnfant', 'trim|required');
		

		$this->form_validation->set_rules('descriptionFamille', 'DescriptionFamille', 'trim|required');
		

		$this->form_validation->set_rules('dateMarriage', 'DateMarriage', 'trim|required');
		

		$this->form_validation->set_rules('adresse', 'Adresse', 'trim|required');
		

		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'nomFamille' => $this->input->post('nomFamille'),
				'nombreEnfant' => $this->input->post('nombreEnfant'),
				'descriptionFamille' => $this->input->post('descriptionFamille'),
				'dateMarriage' => $this->input->post('dateMarriage'),
				'adresse' => $this->input->post('adresse'),
			];

			
			
			$save_famille = $this->model_famille->store($save_data);
            

			if ($save_famille) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_famille;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/famille/edit/' . $save_famille, 'Edit Famille'),
						anchor('administrator/famille', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/famille/edit/' . $save_famille, 'Edit Famille')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/famille');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/famille');
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
	* Update view Familles
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('famille_update');

		$this->data['famille'] = $this->model_famille->find($id);

		$this->template->title('Famille Update');
		$this->render('backend/standart/administrator/famille/famille_update', $this->data);
	}

	/**
	* Update Familles
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('famille_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
				$this->form_validation->set_rules('nomFamille', 'NomFamille', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('nombreEnfant', 'NombreEnfant', 'trim|required');
		

		$this->form_validation->set_rules('descriptionFamille', 'DescriptionFamille', 'trim|required');
		

		$this->form_validation->set_rules('dateMarriage', 'DateMarriage', 'trim|required');
		

		$this->form_validation->set_rules('adresse', 'Adresse', 'trim|required');
		

		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'nomFamille' => $this->input->post('nomFamille'),
				'nombreEnfant' => $this->input->post('nombreEnfant'),
				'descriptionFamille' => $this->input->post('descriptionFamille'),
				'dateMarriage' => $this->input->post('dateMarriage'),
				'adresse' => $this->input->post('adresse'),
			];


			
			
			$save_famille = $this->model_famille->change($id, $save_data);

			if ($save_famille) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/famille', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/famille');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/famille');
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
	* delete Familles
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('famille_delete');

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
            set_message(cclang('has_been_deleted', 'famille'), 'success');
        } else {
            set_message(cclang('error_delete', 'famille'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Familles
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('famille_view');

		$this->data['famille'] = $this->model_famille->join_avaiable()->filter_avaiable()->find($id);

		$this->template->title('Famille Detail');
		$this->render('backend/standart/administrator/famille/famille_view', $this->data);
	}
	
	/**
	* delete Familles
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$famille = $this->model_famille->find($id);

		
		
		return $this->model_famille->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('famille_export');

		$this->model_famille->export(
			'famille', 
			'famille',
			$this->model_famille->field_search
		);
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('famille_export');

		$this->model_famille->pdf('famille', 'famille');
	}


	public function single_pdf($id = null)
	{
		$this->is_allowed('famille_export');

		$table = $title = 'famille';
		$this->load->library('HtmlPdf');
      
        $config = array(
            'orientation' => 'p',
            'format' => 'a4',
            'marges' => array(5, 5, 5, 5)
        );

        $this->pdf = new HtmlPdf($config);
        $this->pdf->setDefaultFont('stsongstdlight'); 

        $result = $this->db->get($table);
       
        $data = $this->model_famille->find($id);
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


/* End of file famille.php */
/* Location: ./application/controllers/administrator/Famille.php */