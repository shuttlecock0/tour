package edu.autocar.dao;

import java.util.List;

import edu.autocar.domain.Image;

public interface ImageDao {
	List<Image> getGalleryImages(int galleryId) throws Exception;

	Image getImage(int imageId) throws Exception;

	int insert(Image image) throws Exception;

	int delete(int imageId) throws Exception;
	
	int deleteByGalleryId(int galleryId) throws Exception;
}
