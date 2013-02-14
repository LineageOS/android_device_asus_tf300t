/*
 * Copyright (C) 2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.app.ActionBar;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.preference.Preference.OnPreferenceChangeListener;
import android.view.MenuItem;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

public class DeviceSettings extends PreferenceActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // This activity is always called from another activity, so we
        // assume that HOME_UP button should be always displayed
        getActionBar().setDisplayOptions(ActionBar.DISPLAY_SHOW_HOME);
        getActionBar().setDisplayHomeAsUpEnabled(true);

        super.onCreate(savedInstanceState);
    }

    @Override
    public void onBuildHeaders(List<Header> target) {
        loadHeadersFromResource(R.xml.preferences_header, target);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
       switch (item.getItemId()) {
          case android.R.id.home:
              finish();
              return true;
          default:
             return super.onOptionsItemSelected(item);
       }
    }

    public static class CpuSettingsFragment
        extends PreferenceFragment implements OnPreferenceChangeListener {

        private ListPreference mCpuMode;

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);

            addPreferencesFromResource(R.xml.preferences_cpu);

            String currCpuMode = CpuUtils.CPU_SETTING_PERFORMANCE;
            if (CpuUtils.getCpuMode() != null) {
                currCpuMode = CpuUtils.getCpuMode();
            }

            mCpuMode = (ListPreference)findPreference(CpuUtils.PREFERENCE_CPU_MODE);
            mCpuMode.setValueIndex(getCpuModeIndex(currCpuMode));
            mCpuMode.setOnPreferenceChangeListener(this);
        }

        @Override
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            String key = preference.getKey();
            if (key.compareTo(CpuUtils.PREFERENCE_CPU_MODE) == 0) {
                final String newCpuMode = (String)newValue;
                CpuUtils.setCpuMode(newCpuMode);
            }
            return true;
        }

        private int getCpuModeIndex(String mode) {
            if (mode.equals(CpuUtils.CPU_SETTING_POWER_SAVE)) {
                return Integer.parseInt(CpuUtils.CPU_SETTING_POWER_SAVE);
            }
            if (mode.equals(CpuUtils.CPU_SETTING_PERFORMANCE)) {
                return Integer.parseInt(CpuUtils.CPU_SETTING_PERFORMANCE);
            }
            return Integer.parseInt(CpuUtils.CPU_SETTING_BALANCED);
        }
    }

}
