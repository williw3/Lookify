package com.leewatterson.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.leewatterson.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song, Long> {
	List<Song> findAll();
	List<Song> findTop5ByOrderByRatingDesc();
	List<Song> findByArtistContaining(String search);
	
}
