;; Functions
(function_definition
    body: (block) @function.inner) @function.outer

;; Classes
(class_definition
    body: (block) @class.inner) @class.outer

;; Parameters
(parameters
    (identifier) @parameter.inner) @parameter.outer

