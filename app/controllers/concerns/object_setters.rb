module ObjectSetters
  extend ActiveSupport::Concern

  # replaces rails set_* controller method in most cases
  def set_object(model)
    value = model.find(get_param_value(model))
    instance_variable_set("@" + model.name.underscore, value)
  end

  private 
    def get_param_value(model)
      if params[model.name.underscore + "_id"].present?
        return params[model.name.underscore + "_id"] 
      else
        return params[:id] unless params[:id].nil?
      end
      
      return nil
    end

end