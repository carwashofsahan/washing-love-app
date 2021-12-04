package org.wl.service.impl;

import org.wl.dto.ReviewRating;
import org.wl.dto.ReviewRatingDetail;
import org.wl.entity.WashCenter;
import org.wl.repo.ReviewRatingRepo;
import org.wl.repo.WashCenterRepo;
import org.wl.service.ReviewRatingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@SuppressWarnings({"RedundantThrows", "CaughtExceptionImmediatelyRethrown", "RedundantIfStatement", "UnnecessaryLocalVariable", "ConstantConditions", "SpringJavaAutowiredFieldsWarningInspection"})

@Service
@Transactional
public class ReviewRatingServiceImpl implements ReviewRatingService {
    @Autowired
    private ReviewRatingRepo repo;
    @Autowired
    private WashCenterRepo washCenterRepo;
    @Autowired
    private ModelMapper mapper;

    @Override
    public Boolean save(ReviewRating reviewRatingDto) throws Exception {
        try {
            WashCenter washCenterById1 = washCenterRepo.findWashCenterById(reviewRatingDto.getWashCenter().getId());
            if(washCenterById1 != null){

           //     org.example.demo.entity.ReviewRating save = repo.save(getReviewRating(reviewRatingDto));
                boolean add = washCenterById1.getReviewRatings().add(getReviewRating(reviewRatingDto));
                if (!add) {
                    return false;
                } else {
                    List<org.wl.entity.ReviewRating> reviewRatingsByWashCenter = repo.findReviewRatingsByWashCenter(getReviewRating(reviewRatingDto).getWashCenter());
                    int sumOfRate = 0;
                    for (org.wl.entity.ReviewRating dto : reviewRatingsByWashCenter) {
                        sumOfRate += dto.getRating();
                    }
                    final int totRate = sumOfRate / reviewRatingsByWashCenter.size();
                    WashCenter washCenterById = washCenterRepo.findWashCenterById(getReviewRating(reviewRatingDto).getWashCenter().getId());
                    washCenterById.setTotalRate(totRate);
                    WashCenter save1 = washCenterRepo.save(washCenterById);
                    if (save1 == null) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }else{
                return false;
            }

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean update(ReviewRating reviewRatingDto) throws Exception {
        if (repo.existsById(reviewRatingDto.getId())) {
            org.wl.entity.ReviewRating save = repo.save(getReviewRating(reviewRatingDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such ReviewRating for update..!");
        }
    }

    @Override
    public Boolean delete(String id) throws Exception {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new RuntimeException("No ReviewRating for delete ID: " + id);
        }
    }

    @Override
    public List<ReviewRating> getAllReviewRatings() throws Exception {
        try {
            List<org.wl.entity.ReviewRating> all = repo.findAll();
            return all.stream().map(this::getReviewRatingDetails).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public ReviewRating getReviewRatingById(String id) throws Exception {
        try {
            return getReviewRatingDto(repo.findReviewRatingById(id));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<ReviewRating> getAllReviewRatingsByWashCenter(String washCenterId) throws Exception {
        try {
            //WashCenter washCenterById = washCenterRepo.findWashCenterById(washCenterId);

            List<org.wl.entity.ReviewRating> all = repo.findAll();
            List<org.wl.entity.ReviewRating> filterList = all.stream().filter(review -> review.getWashCenter().getId().equals(washCenterId))
                    .collect(Collectors.toList());
            return filterList.stream().map(this::getReviewRatingDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    private ReviewRating getReviewRatingDto(org.wl.entity.ReviewRating reviewRating) {
        ReviewRating reviewRatingDto = mapper.map(reviewRating, ReviewRating.class);
        return reviewRatingDto;
    }

    private ReviewRating getReviewRatingDetails(org.wl.entity.ReviewRating reviewRating) {
        ReviewRating reviewRatingDto = mapper.map(reviewRating, ReviewRating.class);
        return reviewRatingDto;
    }

    private org.wl.entity.ReviewRating getReviewRating(ReviewRating reviewRatingDto) {
        org.wl.entity.ReviewRating reviewRating = mapper.map(reviewRatingDto, org.wl.entity.ReviewRating.class);
        return reviewRating;
    }
}
