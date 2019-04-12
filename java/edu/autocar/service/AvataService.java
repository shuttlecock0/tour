package edu.autocar.service;

import org.springframework.web.multipart.MultipartFile;

import edu.autocar.domain.Avata;

public interface AvataService {
	Avata getAvata(String userId) throws Exception;
	void create(String userId, MultipartFile file) throws Exception;
	boolean update(String userId, MultipartFile file) throws Exception;
	boolean delete(String userId) throws Exception;
}
