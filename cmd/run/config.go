package main

import (
	"fmt"

	"github.com/kelseyhightower/envconfig"
)

type config struct {
	Username string `envconfig:"username"`
}

func readConfigFromEnv(prefix string) (*config, error) {
	conf := config{}
	if err := envconfig.Process(prefix, &conf); err != nil {
		return nil, fmt.Errorf("failed to read config from environment: %w", err)
	}

	return &conf, nil
}
