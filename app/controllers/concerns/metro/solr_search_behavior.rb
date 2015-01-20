module Metro::SolrSearchBehavior
  extend ActiveSupport::Concern
  included do
    self.solr_search_params_logic << :add_all_index_fields  
  end

  def add_all_index_fields(solr_parameters, user_parameters)
    fl = ['id']
    #blacklight_config.view_config(document_index_view_type).fields.each do |field|
    #end
    blacklight_config.index_fields.each_key {|k| fl << k}
    solr_parameters[:fl] = fl.join(',') unless fl.empty?
  end

end