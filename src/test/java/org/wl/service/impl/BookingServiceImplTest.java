package org.wl.service.impl;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.wl.dto.Booking;
import org.wl.dto.User;
import org.wl.dto.WashCenter;
import org.wl.repo.BookingRepo;
import org.wl.repo.NotificationRepo;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class BookingServiceImplTest {

    @Mock
    private BookingRepo repo;

    @Mock
    private ModelMapper mapper;

    @Mock
    private NotificationRepo notificationRepo;

    @InjectMocks
    @Resource
    BookingServiceImpl bookingService;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void save_success() throws Exception {
        Booking booking = new Booking();
        booking.setCustomer(new User());
        booking.setDetailer(new User());
        booking.setWashCenter(new WashCenter());

        org.wl.entity.Booking bookingEntity = new org.wl.entity.Booking();
        when(mapper.map(booking, org.wl.entity.Booking.class)).thenReturn(bookingEntity);
        when(repo.save(bookingEntity)).thenReturn(new org.wl.entity.Booking());
        final boolean isSaved = bookingService.save(booking);
        assertTrue(isSaved);
    }

    @Test
    public void save_failed() throws Exception {
        Booking booking = new Booking();
        booking.setCustomer(new User());
        booking.setDetailer(new User());
        org.wl.entity.Booking bookingEntity = new org.wl.entity.Booking();
        when(mapper.map(booking, org.wl.entity.Booking.class)).thenReturn(bookingEntity);
        when(repo.save(bookingEntity)).thenReturn(null);
        final boolean isSaved = bookingService.save(booking);
        assertFalse(isSaved);
    }

    @Test
    public void update_success() throws Exception {
        Booking booking = new Booking();
        booking.setCustomer(new User());
        booking.setDetailer(new User());
        booking.setWashCenter(new WashCenter());
        booking.setId("123");

        org.wl.entity.Booking bookingEntity = new org.wl.entity.Booking();
        when(mapper.map(booking, org.wl.entity.Booking.class)).thenReturn(bookingEntity);
        when(repo.existsById(booking.getId())).thenReturn(true);
        when(repo.save(bookingEntity)).thenReturn(new org.wl.entity.Booking());
        final boolean isUpdated = bookingService.update(booking);
        assertTrue(isUpdated);
    }

    @Test
    public void update_fail() throws Exception {
        Booking booking = new Booking();
        booking.setCustomer(new User());
        booking.setDetailer(new User());
        booking.setWashCenter(new WashCenter());
        booking.setId("123");

        org.wl.entity.Booking bookingEntity = new org.wl.entity.Booking();
        when(mapper.map(booking, org.wl.entity.Booking.class)).thenReturn(bookingEntity);
        when(repo.existsById(booking.getId())).thenReturn(true);
        when(repo.save(bookingEntity)).thenReturn(null);
        final boolean isUpdated = bookingService.update(booking);
        assertFalse(isUpdated);
    }

    @Test
    public void update_fail_no_booking_exists() throws Exception {
        Booking booking = new Booking();
        booking.setCustomer(new User());
        booking.setDetailer(new User());
        booking.setWashCenter(new WashCenter());
        booking.setId("123");

        org.wl.entity.Booking bookingEntity = new org.wl.entity.Booking();
        when(mapper.map(booking, org.wl.entity.Booking.class)).thenReturn(bookingEntity);
        when(repo.existsById(booking.getId())).thenReturn(false);
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> bookingService.update(booking),
                "No such Booking for update..!"
        );
    }
}
