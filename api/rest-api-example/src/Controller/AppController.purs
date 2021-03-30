module AppController where

import HTTPure (ResponseM, ok)

healthCheck :: ResponseM
healthCheck = ok "HealthCheck"
