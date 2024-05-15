package com.web.dto;

import com.web.entity.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class AthleteResponse {

    private Athlete athlete;

    private List<AthleteHistory> athleteHistories = new ArrayList<>();

    private List<TournamentAthlete> tournamentAthletes = new ArrayList<>();

    private List<Injuries> injuries = new ArrayList<>();

    private List<Plan> plans = new ArrayList<>();

    private List<Schedule> schedules = new ArrayList<>();
}
