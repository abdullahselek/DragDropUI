Pod::Spec.new do |s|

    s.name                  = 'DragDropUI'
    s.version               = '1.0.4'
    s.summary               = 'A set of iOS UI components which have drop & drop capability'
    s.homepage              = 'https://github.com/abdullahselek/DragDropUI'
    s.license               = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author                = {
        'Abdullah Selek' => 'abdullahselek@yahoo.com'
    }
    s.source                = {
        :git => 'https://github.com/abdullahselek/DragDropUI.git',
        :tag => s.version.to_s
    }
    s.ios.deployment_target = '9.0'
    s.source_files          = 'DragDropUI/*.{h,swift}'
    s.requires_arc          = true

end