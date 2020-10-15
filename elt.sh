#!/bin/bash

Pipeline 
chmod +x download_dados.sh

	./download_dados.sh
	python3 scripts/create_tables.py
	python3 scripts/insert_data.py
