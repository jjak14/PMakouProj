<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Arbregenealogique Controller
*| --------------------------------------------------------------------------
*| Arbregenealogique site
*|
*/
class Arbregenealogique extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_arbregenealogique');
		$this->load->model('group/model_group');
		$this->lang->load('web_lang', $this->current_lang);
	}

	/**
	* show all Arbregenealogiques
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('arbregenealogique_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['arbregenealogiques'] = $this->model_arbregenealogique->get($filter, $field, $this->limit_page, $offset);
		$this->data['arbregenealogique_counts'] = $this->model_arbregenealogique->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/arbregenealogique/index/',
			'total_rows'   => $this->data['arbregenealogique_counts'],
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Arbregenealogique List');
		$this->render('backend/standart/administrator/arbregenealogique/arbregenealogique_list', $this->data);
	}
	
	/**
	* Add new arbregenealogiques
	*
	*/
	public function add()
	{
		$this->is_allowed('arbregenealogique_add');

		$this->template->title('Arbregenealogique New');
		$this->render('backend/standart/administrator/arbregenealogique/arbregenealogique_add', $this->data);
	}

	/**
	* Add New Arbregenealogiques
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('arbregenealogique_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		

		$this->form_validation->set_rules('nomCouple', 'NomCouple', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('role', 'Role', 'trim|required|max_length[30]');
		

		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'nomCouple' => $this->input->post('nomCouple'),
				'role' => $this->input->post('role'),
			];

			
			
			$save_arbregenealogique = $this->model_arbregenealogique->store($save_data);
            

			if ($save_arbregenealogique) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_arbregenealogique;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/arbregenealogique/edit/' . $save_arbregenealogique, 'Edit Arbregenealogique'),
						anchor('administrator/arbregenealogique', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/arbregenealogique/edit/' . $save_arbregenealogique, 'Edit Arbregenealogique')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/arbregenealogique');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/arbregenealogique');
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
	* Update view Arbregenealogiques
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('arbregenealogique_update');

		$this->data['arbregenealogique'] = $this->model_arbregenealogique->find($id);

		$this->template->title('Arbregenealogique Update');
		$this->render('backend/standart/administrator/arbregenealogique/arbregenealogique_update', $this->data);
	}

	/**
	* Update Arbregenealogiques
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('arbregenealogique_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
				$this->form_validation->set_rules('nomCouple', 'NomCouple', 'trim|required|max_length[255]');
		

		$this->form_validation->set_rules('role', 'Role', 'trim|required|max_length[30]');
		

		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'nomCouple' => $this->input->post('nomCouple'),
				'role' => $this->input->post('role'),
			];


			
			
			$save_arbregenealogique = $this->model_arbregenealogique->change($id, $save_data);

			if ($save_arbregenealogique) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/arbregenealogique', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/arbregenealogique');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/arbregenealogique');
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
	* delete Arbregenealogiques
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('arbregenealogique_delete');

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
            set_message(cclang('has_been_deleted', 'arbregenealogique'), 'success');
        } else {
            set_message(cclang('error_delete', 'arbregenealogique'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Arbregenealogiques
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('arbregenealogique_view');

		$this->data['arbregenealogique'] = $this->model_arbregenealogique->join_avaiable()->filter_avaiable()->find($id);

		$this->template->title('Arbregenealogique Detail');
		$this->render('backend/standart/administrator/arbregenealogique/arbregenealogique_view', $this->data);
	}
	
	/**
	* delete Arbregenealogiques
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$arbregenealogique = $this->model_arbregenealogique->find($id);

		
		
		return $this->model_arbregenealogique->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('arbregenealogique_export');

		$this->model_arbregenealogique->export(
			'arbregenealogique', 
			'arbregenealogique',
			$this->model_arbregenealogique->field_search
		);
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('arbregenealogique_export');

		$this->model_arbregenealogique->pdf('arbregenealogique', 'arbregenealogique');
	}


	public function single_pdf($id = null)
	{
		$this->is_allowed('arbregenealogique_export');

		$table = $title = 'arbregenealogique';
		$this->load->library('HtmlPdf');
      
        $config = array(
            'orientation' => 'p',
            'format' => 'a4',
            'marges' => array(5, 5, 5, 5)
        );

        $this->pdf = new HtmlPdf($config);
        $this->pdf->setDefaultFont('stsongstdlight'); 

        $result = $this->db->get($table);
       
        $data = $this->model_arbregenealogique->find($id);
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


/* End of file arbregenealogique.php */
/* Location: ./application/controllers/administrator/Arbregenealogique.php */