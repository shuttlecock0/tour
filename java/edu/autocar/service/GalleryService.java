package edu.autocar.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.autocar.domain.Gallery;
import edu.autocar.domain.PageInfo;

public interface GalleryService {
	PageInfo<Gallery> getPage(int page) throws Exception;

	Gallery getGallery(int galleryId) throws Exception;

	List<Gallery> findByOwner(String userId) throws Exception;

	void create(Gallery gallery, List<MultipartFile> list) throws Exception;

	boolean update(Gallery gallery) throws Exception;

	boolean delete(int galleryId, String password) throws Exception;
}
