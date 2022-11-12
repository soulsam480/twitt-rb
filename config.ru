# frozen_string_literal: true

require './config/environment'

use UsersController
use SessionController
run AppController
