// Rails 7.1以前の時にStimulusに必要だったファイル

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)
