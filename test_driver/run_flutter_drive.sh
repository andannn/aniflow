#!/bin/zsh

# Run the integration test
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/integration_test.dart \
  --flavor=full
