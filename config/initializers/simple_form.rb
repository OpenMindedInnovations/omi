# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|

  config.wrappers :foundation, tag: :div, class: 'row', error_class: 'error' do |b|
    b.wrapper tag: :div, class: 'large-12 columns' do |col|
      col.use :placeholder
      col.use :label_input
      col.use :error, {
        :wrap_with => {
          :tag => :small,
          :class => 'error'
        }
      }
    end
  end 

  config.button_class = 'button radius'

  config.browser_validations = false

  config.default_wrapper = :foundation

end
