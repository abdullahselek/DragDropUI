Pod::Spec.new do |s|
    s.name                  = 'DragDropUI'
    s.version               = '1.1.0'
    s.summary               = 'A set of iOS UI components which have drag & drop capability'
    s.homepage              = 'https://github.com/abdullahselek/DragDropUI'
    s.license               = {:type => 'MIT', :file => 'LICENSE'}
    s.author                = {'Abdullah Selek' => 'abdullahselek@yahoo.com'}
    s.source                = {:git => 'https://github.com/abdullahselek/DragDropUI.git', :tag => s.version.to_s}
    s.ios.deployment_target = '11.0'
    s.source_files          = 'DragDropUI/*.{h,swift}'
    s.requires_arc          = true
    s.swift_versions        = ['5.0', '5.1', '5.2', '5.3']
end